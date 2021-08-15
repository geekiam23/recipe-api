class SpoonacularResponse
  attr_accessor :body, :success, :headers, :code

  def initialize(code, response)
    @code = code
		@body = response
    @success = false
    mock_response_body
  end

  def mock_response_body
    if (200..299).cover?(@code)
      @success = true
      @data = @body
    else
      @body = { errors: [{"message": "TBD"}] }
    end
  end
end
