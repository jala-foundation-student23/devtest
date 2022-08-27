class CatsController < ApplicationController
  before_action :set_cat, only: %i[ show edit update destroy ]
  before_action :set_global_cat

  require 'json'

  # GET /cats or /cats.json
  def index
    @cats = Cat.all
  end

  def cat
    @cat_image = @cat_service.cat
  end

  def tag
    @tag = @cat_service.tag
  end

  # GET /cats/1 or /cats/1.json
  def show
  end

  # GET /cats/new
  def new
    @cat = Cat.new
  end

  # GET /cats/1/edit
  def edit
  end

  # POST /cats or /cats.json
  def create
    @cat = Cat.new(cat_params)

    respond_to do |format|
      if @cat.save
        format.html { redirect_to cat_url(@cat), notice: "Cat was successfully created." }
        format.json { render :show, status: :created, location: @cat }
        format.turbo_stream
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @cat.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cats/1 or /cats/1.json
  def update
    respond_to do |format|
      if @cat.update(cat_params)
        format.html { redirect_to cat_url(@cat), notice: "Cat was successfully updated." }
        format.json { render :show, status: :ok, location: @cat }
        format.turbo_stream
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @cat.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cats/1 or /cats/1.json
  def destroy
    @cat.destroy

    respond_to do |format|
      format.html { redirect_to cats_url, notice: "Cat was successfully destroyed." }
      format.json { head :no_content }
      format.turbo_stream
    end
  end

  private
    def set_cat
      @cat = Cat.find(params[:id])
    end

    def set_global_cat
      @cat_service = GlobalCat.new
    end

    def cat_params
      params.require(:cat).permit(:name, :image_url, :favorited, :is_adopted)
    end
end
