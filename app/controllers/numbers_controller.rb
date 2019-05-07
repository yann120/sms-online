class NumbersController < ApplicationController
  before_action :set_number, only: [:show, :edit, :update, :destroy]

  # GET /numbers
  # GET /numbers.json

  private def get_country_image_url(number)
    if number.country == "France"
      return "https://upload.wikimedia.org/wikipedia/commons/thumb/c/c3/Flag_of_France.svg/1280px-Flag_of_France.svg.png"
    end
  end

  def index
    @numbers = Number.all
  end

  # GET /numbers/1
  # GET /numbers/1.json
  def show
    @messages = Message.where(to: @number.phonenumber).limit(50).order(created_at: :desc)
    @image_url = get_country_image_url(@number)
  end

  # GET /numbers/new
  def new
    @number = Number.new
  end

  # GET /numbers/1/edit
  def edit
  end

  # POST /numbers
  # POST /numbers.json
  def create
    @number = Number.new(number_params)

    respond_to do |format|
      if @number.save
        format.html { redirect_to @number, notice: 'Number was successfully created.' }
        format.json { render :show, status: :created, location: @number }
      else
        format.html { render :new }
        format.json { render json: @number.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /numbers/1
  # PATCH/PUT /numbers/1.json
  def update
    respond_to do |format|
      if @number.update(number_params)
        format.html { redirect_to @number, notice: 'Number was successfully updated.' }
        format.json { render :show, status: :ok, location: @number }
      else
        format.html { render :edit }
        format.json { render json: @number.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /numbers/1
  # DELETE /numbers/1.json
  def destroy
    @number.destroy
    respond_to do |format|
      format.html { redirect_to numbers_url, notice: 'Number was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_number
      @number = Number.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def number_params
      params.require(:number).permit(:phonenumber, :country)
    end
end
