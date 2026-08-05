class AuditExecutionsController < ApplicationController
  before_action :set_audit_execution, only: %i[ show edit update destroy ]

  # GET /audit_executions or /audit_executions.json
  def index
    @audit_executions = AuditExecution.all
  end

  # GET /audit_executions/1 or /audit_executions/1.json
  def show
  end

  # GET /audit_executions/new
  def new
    @audit_execution = AuditExecution.new
  end

  # GET /audit_executions/1/edit
  def edit
  end

  # POST /audit_executions or /audit_executions.json
  def create
    @audit_execution = AuditExecution.new(audit_execution_params)

    respond_to do |format|
      if @audit_execution.save
        format.html { redirect_to @audit_execution, notice: "Audit execution was successfully created." }
        format.json { render :show, status: :created, location: @audit_execution }
      else
        format.html { render :new, status: :unprocessable_content }
        format.json { render json: @audit_execution.errors, status: :unprocessable_content }
      end
    end
  end

  # PATCH/PUT /audit_executions/1 or /audit_executions/1.json
  def update
    respond_to do |format|
      if @audit_execution.update(audit_execution_params)
        format.html { redirect_to @audit_execution, notice: "Audit execution was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @audit_execution }
      else
        format.html { render :edit, status: :unprocessable_content }
        format.json { render json: @audit_execution.errors, status: :unprocessable_content }
      end
    end
  end

  # DELETE /audit_executions/1 or /audit_executions/1.json
  def destroy
    @audit_execution.destroy!

    respond_to do |format|
      format.html { redirect_to audit_executions_path, notice: "Audit execution was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_audit_execution
      @audit_execution = AuditExecution.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def audit_execution_params
      params.expect(audit_execution: [ :client_id, :executed_at ])
    end
end
