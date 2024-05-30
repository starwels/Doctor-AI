class Admin::ArchivesController < ApplicationController
  def index
    @archives = Archive.all
  end

  def new
    @archive = Archive.new
  end

  def create
    @archive = Archive.new(archive_params)

    if @archive.save
      redirect_to admin_archives_path
    else
      render :new
    end
  end

  private

  def archive_params
    params.require(:archive).permit(:title, :pdf)
  end
end
