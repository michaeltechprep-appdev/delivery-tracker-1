class PackagesController < ApplicationController
  def index
    matching_packages = Package.where({:user_id => session.fetch(:user_id)})

    @list_waiting_on = matching_packages.where({:status => "waiting_on"})
    @received = matching_packages.where({:status => "received"})
    render({ :template => "packages/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_packages = Package.where({ :id => the_id })

    @the_package = matching_packages.at(0)

    render({ :template => "packages/show.html.erb" })
  end

  def create
    the_package = Package.new
    the_package.description = params.fetch("query_description")
    the_package.arrival = params.fetch("query_arrival")
    the_package.details = params.fetch("query_details")
    the_package.status = "waiting_on"
    the_package.user_id = session.fetch(:user_id)

    if the_package.valid?
      the_package.save
      redirect_to("/", { :notice => "Added to list" })
    else
      redirect_to("/", { :alert => the_package.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_package = Package.where({ :id => the_id }).at(0)

    # the_package.description = params.fetch("query_description")
    # the_package.arrival = params.fetch("query_arrival")
    # the_package.details = params.fetch("query_details")
    the_package.status = params.fetch("query_status")

    if the_package.valid?
      the_package.save
      redirect_to("/", { :notice => "Package updated successfully."} )
    else
      redirect_to("/packages/#{the_package.id}", { :alert => the_package.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_package = Package.where({ :id => the_id }).at(0)

    the_package.destroy

    redirect_to("/packages", { :notice => "Package deleted successfully."} )
  end
end
