class UsersController < ApplicationController
  # GET /users
  # GET /users.xml
  def index
    @users = User.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @users }
    end
  end

  # GET /users/1
  # GET /users/1.xml
  def show
    @user = User.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @user }
    end
  end

  # GET /users/new
  # GET /users/new.xml
  def new
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @user }
    end
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end

  # POST /users
  # POST /users.xml
  def create
    params[:user][:is_admin] = 0 if params[:user]
    @user = User.new(params[:user])

    respond_to do |format|
      if @user.save
        format.html { redirect_to(:root, :notice => 'Zarejestrowales sie.') }
      else
        format.html { render :action => "new" }
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.xml
  def update
    if !@is_admin
      redirect_to :root, :notice => 'Musisz byc rootem'
      return
    else
        @user = User.find(params[:id])
    
        respond_to do |format|
          if @user.update_attributes(params[:user])
            format.html { redirect_to(@user, :notice => 'User was successfully updated.') }
            format.xml  { head :ok }
          else
            format.html { render :action => "edit" }
            format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
          end
        end
  end
  end
  # DELETE /users/1
  # DELETE /users/1.xml
  def destroy
    # Do tych wszystkich metod co moga cos dodawac/zmieniac trzeba dodac ze musi byc user zalogowany i dodatkowo
    # moze zmieniac tylko siebie (chyba ze jest adminem)
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to(users_url) }
      format.xml  { head :ok }
    end
  end
  def login
    print "Test"
    if @user_id
      redirect_to :root, :notice => "Jestes juz zalogowany"
    end
    if params[:login] && params[:pass]
      u = User.auth(params[:login], params[:pass])
      if u.class == User
        session[:user_id] = u.id
        redirect_to :root, :notice => "Zostales zalogowany"
      else
        @login_errors = "Niepoprawne dane"
      end
    end
  end
  def logout
    session[:user_id] = nil
    @user = nil
    redirect_to :root
  end
  
  def profile
    if session[:user_id]
      @user = User.find(session[:user_id])
      render :show
    end
  end
end
