class VideosController < ApplicationController
  before_action :set_video, only: [:show, :edit, :update, :destroy]
  # GET /videos
  # GET /videos.json
  def index
    @videos = Video.all
  end

  # GET /videos/1
  # GET /videos/1.json
  def show
  end

  # GET /videos/new
  def new
    @video = Video.new
  end

  # GET /videos/1/edit
  def edit
  end

  # POST /videos
  # POST /videos.json
  def create
    @video = Video.new(video_params)
    if !cookies[:login].nil? 
      user = User.find_by nick: cookies[:login];
      @video.user = user.id;
    end
    if !params[:arq_video].nil?
      @video.valid = params[:arq_video].original_filename
      if !@video.user.nil?
        @video.file_path = uploaded params[:arq_video],@video.user
      else
        @video.file_path = uploaded params[:arq_video]
      end
    else
      @video.valid = nil
    end
    respond_to do |format|
      if @video.save
        if !cookies[:login].nil?
          format.html { redirect_to "/login?notice=Upload+feito+com+sucesso!"  }
        else
          format.html { redirect_to controller:'stream',action:'show',name_video:@video.title , notice: 'Upload feito com sucesso!' }
        end
        format.json { render :show, status: :created, location: @video }
      else
        format.html { render :new }
        format.json { render json: @video.errors, status: :unprocessable_entity }
      end
    end
  end

  def uploaded file_up, user='default'
    Dir.mkdir Rails.root+"public/uploads/#{user}" unless Dir.exists?(Rails.root+"public/uploads/#{user}")
    path = Rails.root.join("public", "uploads/#{user}", file_up.original_filename)
    File.open(path , 'wb') do |file|
      file.write(file_up.read)
    end
    return path
  end

  def del_upfile path
    if path.nil?
      path = ' '
    end
    File.delete path if File.exists?(path)
  end
  # PATCH/PUT /videos/1
  # PATCH/PUT /videos/1.json
  def update
    respond_to do |format|
      if @video.update(video_params)
        format.html { redirect_to @video, notice: 'Video was successfully updated.' }
        format.json { render :show, status: :ok, location: @video }
      else
        format.html { render :edit }
        format.json { render json: @video.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /videos/1
  # DELETE /videos/1.json
  def destroy
    del_upfile @video.file_path
    @video.destroy

    respond_to do |format|
      format.html { redirect_to videos_url, notice: 'Video was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_video
      @video = Video.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def video_params
      params.require(:video).permit(:title, :description)
    end
end
