class TfIdf
  
  # n the n-grams of the data http://en.wikipedia.org/wiki/N-gram
  def initialize(data)
    @data = data
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
    
  private
  
  def total_documents
    @data.size.to_f
  end
  
  # Returns all terms, once
  def terms
    @data.flatten.uniq
  end
  
  # IDF = total_documents / number_of_document_term_appears_in
  # This calculates how important a term is.
  def calculate_inverse_document_frequency
    results = {}
    
    terms.each do |term|
      count = 0.0
      
      @data.each do |document|
        count += 1 if document.include?(term)
      end
      
      results[term] = Math.log10(total_documents / count)
    end
    
    results
  end
  
  # TF = number_of_n_term_in_document / number_of_terms_in_document
  # Calculates the number of times a term appears in the document
  # It is then normalized (as some documents are longer than others)
  def calculate_term_frequencies
    results = []
    
    @data.each do |document|
      document_result = {}
      
      document.each do |term|
        if document_result.key?(term)
          document_result[term] += 1.0
        else
          document_result[term] = 1.0
        end
      end
      
      # Normalize the count
      document_result.each_key do |term|
        document_result[term] /= document.size
      end
      
      results << document_result
    end
    
    results
  end
    
end