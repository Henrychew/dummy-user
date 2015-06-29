class User < ActiveRecord::Base
  # Remember to create a migration!
  # e.g., User.authenticate('josh@codedivision.com', 'apples123')
def self.authenticate(email, password)
  byebug
  @user = User.find_by_email(params[:email])
  unless @user.nil?
      if @user.password == password
        return @user
      else
        return nil
      end
  else
    return nil
  end
end

private
  def user_params
    params.require(:user).permit(:name, :email, :password)
  end
end
byebug

    # if email and password correspond to a valid user, return that user
    # otherwise, return nil

