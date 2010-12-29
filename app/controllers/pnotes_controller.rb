class PnotesController < ApplicationController
  # GET /pnotes
  # GET /pnotes.xml
  def index
    @pnotes = Pnote.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @pnotes }
    end
  end

  # GET /pnotes/1
  # GET /pnotes/1.xml
  def show
    @preport = Preport.find(params[:preport_id])
    @pnote = @preport.pnotes.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @pnote }
    end
  end

  # GET /pnotes/new
  # GET /pnotes/new.xml
  def new
    @preport = Preport.find(params[:preport_id])
    @pnote = @preport.pnotes.build

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @pnote }
    end
  end

  # GET /pnotes/1/edit
  def edit
    
    @preport = Preport.find(params[:preport_id])
    @pnote = @preport.pnotes.find(params[:id])
  end

  # POST /pnotes
  # POST /pnotes.xml
  def create
    @preport = Preport.find(params[:preport_id])
    @pnote = @preport.pnotes.build(params[:pnote])

    respond_to do |format|
      if @pnote.save
        format.html { redirect_to(@preport, :notice => 'Note was successfully created.') }
        format.xml  { render :xml => @preport, :status => :created, :location => @preport }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @pnote.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /pnotes/1
  # PUT /pnotes/1.xml
  def update
    @preport = Preport.find(params[:preport_id])
    @pnote = @preport.pnotes.find(params[:id])

    respond_to do |format|
      if @pnote.update_attributes(params[:pnote])
        format.html { redirect_to(@preport, :notice => 'Note was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @pnote.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /pnotes/1
  # DELETE /pnotes/1.xml
  def destroy
    @preport = Preport.find(params[:preport_id])
    @pnote = @preport.pnotes.find(params[:id])
    @pnote.destroy

    respond_to do |format|
      format.html { redirect_to(@preport) }
      format.xml  { head :ok }
    end
  end
end
