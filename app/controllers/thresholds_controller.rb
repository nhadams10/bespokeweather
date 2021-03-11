class ThresholdsController < ApplicationController
  def index
    matching_thresholds = Threshold.all

    @list_of_thresholds = matching_thresholds.order({ :created_at => :desc })

    render({ :template => "thresholds/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_thresholds = Threshold.where({ :id => the_id })

    @the_threshold = matching_thresholds.at(0)

    render({ :template => "thresholds/show.html.erb" })
  end

  def create
    the_threshold = Threshold.new
    the_threshold.user_id = params.fetch("query_user_id")
    the_threshold.coldest = params.fetch("query_coldest")
    the_threshold.cold = params.fetch("query_cold")
    the_threshold.moderate = params.fetch("query_moderate")
    the_threshold.warm = params.fetch("query_warm")
    the_threshold.warmest = params.fetch("query_warmest")

    if the_threshold.valid?
      the_threshold.save
      redirect_to("/thresholds", { :notice => "Threshold created successfully." })
    else
      redirect_to("/thresholds", { :notice => "Threshold failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_threshold = Threshold.where({ :id => the_id }).at(0)

    the_threshold.user_id = params.fetch("query_user_id")
    the_threshold.coldest = params.fetch("query_coldest")
    the_threshold.cold = params.fetch("query_cold")
    the_threshold.moderate = params.fetch("query_moderate")
    the_threshold.warm = params.fetch("query_warm")
    the_threshold.warmest = params.fetch("query_warmest")

    if the_threshold.valid?
      the_threshold.save
      redirect_to("/thresholds/#{the_threshold.id}", { :notice => "Threshold updated successfully."} )
    else
      redirect_to("/thresholds/#{the_threshold.id}", { :alert => "Threshold failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_threshold = Threshold.where({ :id => the_id }).at(0)

    the_threshold.destroy

    redirect_to("/thresholds", { :notice => "Threshold deleted successfully."} )
  end
end
