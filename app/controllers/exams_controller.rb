class ExamsController < ApplicationController
  # GET /exams
  # GET /exams.xml
  
  def index
    @exams = Exam.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @exams }
    end
  end

  # GET /exams/1
  # GET /exams/1.xml
  def show
    @exam = Exam.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @exam }
      format.json {render :json => @exam}
    end
  end

  # GET /exams/new
  # GET /exams/new.xml
  def new
    @exam = Exam.new
    
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @exam }
    end
  end

  # GET /exams/1/edit
  def edit
    if @is_admin
      @exam = Exam.find(params[:id])
    end
  end

  # POST /exams
  # POST /exams.xml
  def create
    @exam = Exam.new(params[:exam])

    respond_to do |format|
      if @exam.save
        format.html { redirect_to(@exam, :notice => 'Exam was successfully created.') }
        format.xml  { render :xml => @exam, :status => :created, :location => @exam }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @exam.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /exams/1
  # PUT /exams/1.xml
  def update
    if @is_admin
      @exam = Exam.find(params[:id])
        if @exam.update_attributes(params[:exam])
          redirect_to @exam, :action=> 'show', :notice => 'Poprawnie zmodyfikowano egzamin' 
          return
        else
          render :action => "edit" 
          return
        end  
    else
      redirect_to @exam, :action=>"edit", :notice => "brak uprawnien"
    end
  end 
  # DELETE /exams/1
  # DELETE /exams/1.xml
  def destroy
    if @is_admin
          @exam = Exam.find(params[:id])
          @exam.destroy
    else
          redirect_to :back, :notice => "Nie masz praw"
          return
    end
      redirect_to :root
  end
  
  def search
    if params[:q]
      @exams = Exam.where("name like ? or description like ?", params[:q], params[:q]+"%")
    end
  end
end
