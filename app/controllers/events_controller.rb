class EventsController < ApplicationController
  before_action :set_event, only: [:show, :update, :destroy]

  # GET /events
  def index
    @events = Event.where(user: @current_user)

    render json: @events
  end

  # GET /events/1
  def show
    render json: @event
  end

  # POST /events
  def create
    @current_user.events << Event.new(event_params)
    @event = @current_user.events.last
    
    if @event.save

      # create the jobs
      @event.count.times do
        random_date = Time.at((@event.end_date.to_f - @event.begin_date.to_f)*rand + @event.begin_date.to_f)
        
        @event.jobs << Job.new(message: @event.name, execution_date: random_date)
        @job = @event.jobs.last

        if @job.save!
          begin 
            NotificationWorker.perform_at(Date.parse(@event.execution_date), @event.id)
          rescue => e
            p "Failed to set the job process:", e
          end
        end

      end

      render json: @event, status: :created, location: @event
    else
      render json: @event.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /events/1
  def update
    if @event.update(event_params)
      render json: @event
    else
      render json: @event.errors, status: :unprocessable_entity
    end
  end

  # DELETE /events/1
  def destroy
    @event.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
      # we use a 404 status code because we want to hide if this event exists to other users (they shouldn't know if an ID exists in the database)
      render json: { "error": "Invalid Event ID" }, status: 404 if @current_user.id != @event.user_id
    end

    # Only allow a trusted parameter "white list" through.
    def event_params
      params.require(:event).permit(:name, :count, :begin_date, :end_date, :user_id)
    end
end
