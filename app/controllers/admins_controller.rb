# frozen_string_literal: true
class AdminsController < ApplicationController
  def index; end

  def new
    @admin = Admin.new
  end

  def create
    params.permit!
    @admin = Admin.new(params[:admin])
    if @admin.save
      redirect_to "/admin/#{@admin.id}", success: 'User created Successfully'
    else
      redirect_to '/admin/new', danger: 'user not created'
    end
  end

  def show
    @admin = Admin.find(params[:id])
  end
end
