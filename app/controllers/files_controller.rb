class FilesController < ApplicationController
  include FilesHelper
  before_action :authenticate_user!

  # expose :file, -> { ActiveStorage::Attachment.find(params[:id]) }
  # expose(:resource) { file.record }

  def destroy
    @file = ActiveStorage::Attachment.find(params[:id])

    @file.purge if current_user.author_of?(@file.record)

    #url = @file.record_type == 'Answer' ? @file.record.question : @file.record
    #redirect_to question_path(url)
  end

end
