require 'streamio-ffmpeg'

class VideosController < ApplicationController
  before_action :set_video, only: [:show, :edit, :update, :destroy]
  # GET /videos
  # GET /videos.json
  def index
    if !params[:name_video].nil?
      @video = Video.find_by title: params[:name_video]
      if !@video.nil?
        redirect_to @video
      else
        redirect_to action: 'show_error'
      end
    else
      if !cookies[:login].nil?
        user = User.find_by nick: cookies[:login]
        @videos = Video.where({user: user.id})
      else
        @videos = Video.all
      end
    end
  end

  def show_error
  end

  def channel
    @user = User.find_by nick: params[:user_name]
    @videos = Video.where({user: @user.id})
  end

  # GET /videos/1
  # GET /videos/1.json
  def show
    @video_id = Video.find(params[:id])
    @new_comment = Comment.build_from(@video, @video_id, "")
    cookies[:return_to] = request.env['PATH_INFO']
    @videos = Video.where("title LIKE :title_name OR description LIKE :desc_text",
      {:title_name => "%#{@video.title}%", :desc_text => "%#{@video.description}%"})
  end

  # GET /videos/new
  def new
    @video = Video.new
  end

  # GET /videos/1/edit
  def edit
  end

  def edit_video
    @video = Video.find(params[:id])
    if params[:title] != "" && params[:description] != ""
      @video.title = params[:title]
      @video.description = params[:description]
      @video.valid = "arq.mp4"
      @video.save!
      redirect_to @video
    else
      respond_to do |format|
        format.html { redirect_to "/videos/#{@video.id}/edit" , notice: 'Campos vazios' }
      end
    end
  end

  # POST /videos
  # POST /videos.json
  def create
    @video = Video.new(video_params)
    if !cookies[:login].nil? 
      user = User.find_by nick: cookies[:login]
      @video.user = user.id
    else
      @video.user = -1
    end
    if !params[:arq_video].nil?
      @video.valid = params[:arq_video].original_filename
      if @video.user != -1
        @video.file_path = uploaded params[:arq_video],@video.user
      else
        @video.file_path = uploaded params[:arq_video]
      end
    else
      @video.valid = nil
    end
    cookies.delete :arquivo unless cookies[:arquivo].nil?
    respond_to do |format|
      if @video.save
        format.html { redirect_to @video , notice: 'Upload feito com sucesso!' }
        format.json { render :show, status: :created, location: @video }
      else
        format.html { render :new }
        format.json { render json: @video.errors, status: :unprocessable_entity }
      end
    end
  end

  def convert file,to_path,extention=".mp4",options=%w(-strict -2)
    tmp = "#{Rails.root}/public/uploads/temp"
    Dir.mkdir tmp unless Dir.exists? tmp
    filetmp = "#{tmp}/#{file.original_filename}"
    File.open(filetmp , 'wb') do |filew|
      filew.write(file.read)
    end
    movie = FFMPEG::Movie.new(filetmp)
    ext = File.extname(file.original_filename)
    base = File.basename(file.original_filename, ext)
    file_save = "#{to_path}/#{base}#{extention}"
    movie.transcode(file_save, options)
    FileUtils.rm_rf tmp
    return file_save
  end

  def uploaded file_up, user='default'
    path_save = "#{Rails.root}/public/uploads/#{user}"
    Dir.mkdir "#{Rails.root}/public/uploads" unless Dir.exists? "#{Rails.root}/public/uploads"
    Dir.mkdir path_save unless Dir.exists? path_save
    ext = File.extname(file_up.original_filename)

    if ext == ".mp4" || ext == ".webm"
      file_save = "#{path_save}/#{file_up.original_filename}"
      File.open(file_save , 'wb') do |file|
        file.write(file_up.read)
      end
    elsif ['.mkv','.mpeg','.avi','.wmv','.mpg','.rmvb','.flv'].include?(ext.downcase)
      file_save = convert file_up, path_save
    end
    return file_save
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
