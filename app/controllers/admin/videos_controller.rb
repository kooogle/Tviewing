class Admin::VideosController < Admin::BaseController

  before_action :set_column, except:[:sync_youku_comment]
  before_action :set_video, only: [:show, :edit, :update, :destroy]
  before_action :set_param, only: [:create, :update]

  def new
    @video = Video.new
  end

  def edit
  end

  def create
    only_recommend
    @param[:cover] = Video.file_or_url_to_cover(@param[:photo_file],@param[:cover])
    @param[:duration] = Video.youku_video_duration(@param[:video_url]) if @param[:video_type] == '0'
    @video = Video.new(video_params)
    if @video.save
      redirect_to channel_path(@column.english)
    else
      render :new
    end
  end

  def update
    only_recommend
    @param[:cover] = Video.file_or_url_to_cover(@param[:photo_file],@param[:cover])
    if @video.update(video_params)
      redirect_to channel_path(@column.english)
    else
      render :edit
    end
  end

  def destroy
    @video.destroy
    redirect_to channel_path(@column.english)
  end

  def sync_youku_comment
    video = Video.find(params[:id])
    video.update_youku_comment
    redirect_to :back
  end

  private
    def set_video
      @video = Video.find(params[:id])
    end

    def video_params
      params.require(:video).permit(:column_id, :video_url, :url_code, :recommend, :title, :cover, :duration, :video_type, :summary)
    end

    def set_column
      @column = Column.find(params[:column_id])
    end

    def set_param
      @param = params[:video]
    end

    def only_recommend
      if params[:video][:recommend].to_i == 1
        Video.where(column_id:params[:video][:column_id]).where(recommend:1).each do |video|
          video.update_attributes(recommend:0)
        end
      end
    end
end
