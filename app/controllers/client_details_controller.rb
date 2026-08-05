class ClientDetailsController < ApplicationController
  before_action :set_client_detail, only: %i[ show edit update destroy ]

  # GET /client_details or /client_details.json
  def index
    @client_details = ClientDetail.all
  end

  # GET /client_details/1 or /client_details/1.json
  def show
  end

  # GET /client_details/new
  def new
    @client_detail = ClientDetail.new
  end

  # GET /client_details/1/edit
  def edit
  end

  # POST /client_details or /client_details.json
  def create
    @client_detail = ClientDetail.new(client_detail_params)

    respond_to do |format|
      if @client_detail.save
        format.html { redirect_to @client_detail, notice: "Client detail was successfully created." }
        format.json { render :show, status: :created, location: @client_detail }
      else
        format.html { render :new, status: :unprocessable_content }
        format.json { render json: @client_detail.errors, status: :unprocessable_content }
      end
    end
  end

  # PATCH/PUT /client_details/1 or /client_details/1.json
  def update
    respond_to do |format|
      if @client_detail.update(client_detail_params)
        format.html { redirect_to @client_detail, notice: "Client detail was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @client_detail }
      else
        format.html { render :edit, status: :unprocessable_content }
        format.json { render json: @client_detail.errors, status: :unprocessable_content }
      end
    end
  end

  # DELETE /client_details/1 or /client_details/1.json
  def destroy
    @client_detail.destroy!

    respond_to do |format|
      format.html { redirect_to client_details_path, notice: "Client detail was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_client_detail
      @client_detail = ClientDetail.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def client_detail_params
      params.fetch(:client_detail, {})
    end
end
