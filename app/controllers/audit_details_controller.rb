class AuditDetailsController < ApplicationController
  before_action :set_audit_detail, only: %i[ show edit update destroy ]

  # GET /audit_details or /audit_details.json
  def index
    @audit_details = AuditDetail.all
  end

  # GET /audit_details/1 or /audit_details/1.json
  def show
  end

  # GET /audit_details/new
  def new
    @audit_detail = AuditDetail.new
  end

  # GET /audit_details/1/edit
  def edit
  end

  # POST /audit_details or /audit_details.json
  def create
    @audit_detail = AuditDetail.new(audit_detail_params)

    respond_to do |format|
      if @audit_detail.save
        format.html { redirect_to @audit_detail, notice: "Audit detail was successfully created." }
        format.json { render :show, status: :created, location: @audit_detail }
      else
        format.html { render :new, status: :unprocessable_content }
        format.json { render json: @audit_detail.errors, status: :unprocessable_content }
      end
    end
  end

  # PATCH/PUT /audit_details/1 or /audit_details/1.json
  def update
    respond_to do |format|
      if @audit_detail.update(audit_detail_params)
        format.html { redirect_to @audit_detail, notice: "Audit detail was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @audit_detail }
      else
        format.html { render :edit, status: :unprocessable_content }
        format.json { render json: @audit_detail.errors, status: :unprocessable_content }
      end
    end
  end

  # DELETE /audit_details/1 or /audit_details/1.json
  def destroy
    @audit_detail.destroy!

    respond_to do |format|
      format.html { redirect_to audit_details_path, notice: "Audit detail was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_audit_detail
      @audit_detail = AuditDetail.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def audit_detail_params
      params.expect(audit_detail: [ :audit_result_id, :record_id, :metadata ])
    end
end
