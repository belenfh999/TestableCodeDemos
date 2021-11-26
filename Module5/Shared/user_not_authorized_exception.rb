class UserNotAuthorizedException < StandardError
  def initialize(msg="User not authorized to print.", exception_type="custom")
    @exception_type = exception_type
    super(msg)
  end
end
