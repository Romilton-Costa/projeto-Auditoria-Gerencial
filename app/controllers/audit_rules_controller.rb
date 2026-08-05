class AuditRulesController < ApplicationController
  before_action :set_audit_rule, only: %i[ show edit update destroy ]

  # GET /audit_rules or /audit_rules.json
  def index
    @audit_rules = AuditRule.all
  end

  # GET /audit_rules/1 or /audit_rules/1.json
  def show
  end

  # GET /audit_rules/new
  def new
    @audit_rule = AuditRule.new
  end

  # GET /audit_rules/1/edit
  def edit
  end

  # POST /audit_rules or /audit_rules.json
  def create
    @audit_rule = AuditRule.new(audit_rule_params)

    respond_to do |format|
      if @audit_rule.save
        format.html { redirect_to @audit_rule, notice: "Audit rule was successfully created." }
        format.json { render :show, status: :created, location: @audit_rule }
      else
        format.html { render :new, status: :unprocessable_content }
        format.json { render json: @audit_rule.errors, status: :unprocessable_content }
      end
    end
  end

  # PATCH/PUT /audit_rules/1 or /audit_rules/1.json
  def update
    respond_to do |format|
      if @audit_rule.update(audit_rule_params)
        format.html { redirect_to @audit_rule, notice: "Audit rule was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @audit_rule }
      else
        format.html { render :edit, status: :unprocessable_content }
        format.json { render json: @audit_rule.errors, status: :unprocessable_content }
      end
    end
  end

  # DELETE /audit_rules/1 or /audit_rules/1.json
  def destroy
    @audit_rule.destroy!

    respond_to do |format|
      format.html { redirect_to audit_rules_path, notice: "Audit rule was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_audit_rule
      @audit_rule = AuditRule.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def audit_rule_params
      params.expect(audit_rule: [ :name, :description, :severity ])
    end
end
