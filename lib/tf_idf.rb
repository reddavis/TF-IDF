require 'n_gram'

class TfIdf
  
  # n the n-grams of the data http://en.wikipedia.org/wiki/N-gram
  def initialize(data, n=1)
    @data = data
    @n = n
  end
  
  def tf
    @tf ||= calculate_term_frequencies
  end
  
  def idf
    @idf ||= calculate_inverse_document_frequency
  end
  
  # This is basically calculated by multiplying tf by idf
  def tf_idf
    tf_idf = tf.clone
    
    tf.each_with_index do |document, index|
      document.each_pair do |term, tf_score|
        tf_idf[index][term] = tf_score * idf[term]
      end
    end
    
    tf_idf
  end
  
  def total_documents
    @data.size.to_f
  end
  
  private
  
  # IDF = total_documents / number_of_document_term_appears_in
  # This calculates how important a term is.
  def calculate_inverse_document_frequency
    original_ngrams = n_gram.ngrams_of_all_data[@n].clone
    
    original_ngrams.each_key do |term|
      
      # Calculate how many documents the term appears in
      count = 0.0
      n_gram.ngrams_of_inputs.each do |document|
        count += 1 if document[@n].key?(term)
      end
    
      original_ngrams[term] = Math.log10(total_documents / count)
    end
    
    original_ngrams
  end
  
  # TF = number_of_n_term_in_document / number_of_terms_in_document
  # Calculates the number of times a term appears in the document
  # It is then normalized (as some documents are longer than others)
  def calculate_term_frequencies
    original_ngrams = n_gram.ngrams_of_inputs.clone
        
    original_ngrams.each_with_index do |document, index|
      
      # Calculate the total number of terms
      total_terms = 0.0
      document[@n].each_value {|v| total_terms += v} 
      
      document[@n].each_pair do |key, value|
        original_ngrams[index][@n][key] = (value.to_f / total_terms)
      end
    end
        
    original_ngrams.map {|x| x.map {|y| y[@n] }}.flatten
  end
  
  def n_gram
    @n_gram ||= NGram.new(@data, :n => @n)
  end  
end