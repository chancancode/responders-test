class TestController < ApplicationController

  def html_only
  end

  def json_only
  end

  def html_and_json
  end

  def no_templates
  end

  # def html_template_only
  # end

  # def json_template_only
  # end

  def with_respond_to
    respond_to do |format|
      format.html
      format.json { render json: { source: "respond_to" } }
    end
  end

  def with_explicit_render
    render json: { source: "render" }
  end

end
