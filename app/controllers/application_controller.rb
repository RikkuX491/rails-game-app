class ApplicationController < ActionController::API
    # To access the cookies hash in our controllers, we also need to include the ActionController::Cookies module in our ApplicationController
    include ActionController::Cookies
end
