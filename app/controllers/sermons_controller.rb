class SermonsController < ApplicationController
  before_action :set_sermon, only: [:show, :edit, :update, :destroy]

  # GET /sermons
  # GET /sermons.json
  def index
    @sermons = Sermon.all
    @books = @sermons.group_by(&:book)
  end

  def calendar
    @sermons = Sermon.all
    @joshua = Sermon.where(book: "Joshua")
    @timothy = Sermon.where(book: "1 Timothy")
    @single_names = Sermon.where.not(book: ["1 Timothy", "1 Corinthians"])
    @books = @single_names.group_by(&:book)
  end

  def latest
    @sermon = Sermon.last 
  end

  # GET /sermons/1
  # GET /sermons/1.json
  def show
    @sermon = Sermon.find(params[:id])


    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @sermon }
      format.js { render :json => @sermon.to_json }
    end
  end

  # GET /sermons/new
  def new
    @sermon = Sermon.new
  end

  # GET /sermons/1/edit
  def edit
  end

  # POST /sermons
  # POST /sermons.json
  def create
    @sermon = Sermon.new(sermon_params)

    respond_to do |format|
      if @sermon.save
        format.html { redirect_to @sermon, notice: 'Sermon was successfully created.' }
        format.json { render json: @sermon.to_json }
      else
        format.html { render action: 'new' }
        format.json { render json: @sermon.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sermons/1
  # PATCH/PUT /sermons/1.json
  def update
    respond_to do |format|
      if @sermon.update(sermon_params)
        format.html { redirect_to @sermon, notice: 'Sermon was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: 'edit' }
        format.json { render json: @sermon.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sermons/1
  # DELETE /sermons/1.json
  def destroy
    @sermon.destroy
    respond_to do |format|
      format.html { redirect_to sermons_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sermon
      @sermon = Sermon.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sermon_params
      params.require(:sermon).permit(:team, :book, :sermon_date, :first_chapter, :last_chapter, :first_verse, :last_verse, :color)
    end
end
