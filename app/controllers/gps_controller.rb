class GpsController < ApplicationController
  before_action :set_gp, only: [:show, :edit, :update, :destroy]

  # GET /gps
  # GET /gps.json
  def index
    @gps = Gp.all
    require 'socket'               # Get sockets from stdlib

server = TCPServer.open(2000)  # Socket to listen on port 2000
loop {                         # Servers run forever
  client = server.accept       # Wait for a client to connect
  client.puts(Time.now.ctime)# Send the time to the client
  @respons = client.gets
  client.puts "Closing the connection. Bye!"
  client.close                 # Disconnect from the client
}
  end

  # GET /gps/1
  # GET /gps/1.json
  def show
  end

  # GET /gps/new
  def new
    @gp = Gp.new
  end

  # GET /gps/1/edit
  def edit
  end

  # POST /gps
  # POST /gps.json
  def create
    @gp = Gp.new(gp_params)

    respond_to do |format|
      if @gp.save
        format.html { redirect_to @gp, notice: 'Gp was successfully created.' }
        format.json { render :show, status: :created, location: @gp }
      else
        format.html { render :new }
        format.json { render json: @gp.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /gps/1
  # PATCH/PUT /gps/1.json
  def update
    respond_to do |format|
      if @gp.update(gp_params)
        format.html { redirect_to @gp, notice: 'Gp was successfully updated.' }
        format.json { render :show, status: :ok, location: @gp }
      else
        format.html { render :edit }
        format.json { render json: @gp.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /gps/1
  # DELETE /gps/1.json
  def destroy
    @gp.destroy
    respond_to do |format|
      format.html { redirect_to gps_url, notice: 'Gp was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_gp
      @gp = Gp.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def gp_params
      params.require(:gp).permit(:location)
    end
end
