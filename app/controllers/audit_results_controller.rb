class AuditResultsController < ApplicationController
  before_action :set_audit_result, only: %i[ show edit update destroy ]

  # GET /audit_results or /audit_results.json
  def index
    @audit_results = AuditResult.all
  end

  # GET /audit_results/1 or /audit_results/1.json
  def show
  end

  # GET /audit_results/new
  def new
    @audit_result = AuditResult.new
  end

  # GET /audit_results/1/edit
  def edit
  end

  # POST /audit_results or /audit_results.json
  def create
    @audit_result = AuditResult.new(audit_result_params)

    respond_to do |format|
      if @audit_result.save
        format.html { redirect_to @audit_result, notice: "Audit result was successfully created." }
        format.json { render :show, status: :created, location: @audit_result }
      else
        format.html { render :new, status: :unprocessable_content }
        format.json { render json: @audit_result.errors, status: :unprocessable_content }
      end
    end
  end

  # PATCH/PUT /audit_results/1 or /audit_results/1.json
  def update
    respond_to do |format|
      if @audit_result.update(audit_result_params)
        format.html { redirect_to @audit_result, notice: "Audit result was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @audit_result }
      else
        format.html { render :edit, status: :unprocessable_content }
        format.json { render json: @audit_result.errors, status: :unprocessable_content }
      end
    end
  end

  # DELETE /audit_results/1 or /audit_results/1.json
  def destroy
    @audit_result.destroy!

    respond_to do |format|
      format.html { redirect_to audit_results_path, notice: "Audit result was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_audit_result
      @audit_result = AuditResult.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def audit_result_params
      params.expect(audit_result: [ :audit_execution_id, :audit_rule_id, :total_found ])
    end
end
