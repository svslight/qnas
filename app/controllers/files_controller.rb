class FilesController < ApplicationController
  include FilesHelper
  before_action :authenticate_user!

  # expose(:file) { ActiveStorage::Attachment.find(params[:id]) }
  # expose(:resource) { file.record }

  def destroy
    @file = ActiveStorage::Attachment.find(params[:id])      
    @file.purge if current_user.author_of?(@file.record)
  end

end
