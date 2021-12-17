class EmailAddressIsBlankException < StandardError
  def initialize(msg="A blank email is not valid.", exception_type="custom")
    @exception_type = exception_type
    super(msg)
  end
end
