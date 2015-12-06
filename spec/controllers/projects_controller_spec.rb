require 'rails_helper'

describe ProjectsController, type: :controller do
  render_views

  describe '#index' do
    it 'should render the index template' do
      get :index

      response.should render_template('index')
    end

    it 'should set the projects instance variable' do
      @project = FactoryGirl.create(:project, visible: true)

      get :index

      expect(assigns(:projects)).to eq([@project])
    end

    it 'should set the projects instance variable to only visible projects' do
      @project1 = FactoryGirl.create(:project, visible: true)
      @project2 = FactoryGirl.create(:project, visible: false)

      get :index

      expect(assigns(:projects)).to eq([@project1])
    end
  end

  describe '#show' do
    before(:each) do
      @project = FactoryGirl.create(:project, visible: true)

      @params = {
        id: @project.slug
      }
    end

    it 'should render the show template' do
      get :show, @params

      response.should render_template('show')
    end

    it 'should render 404 when project cannot be found' do
      get :show, id: 'wrong'

      response.should render_template('errors/show')
    end

    it 'should render 404 when project is not visible' do
      @project.visible = false
      @project.save

      get :show, @params

      response.should render_template('errors/show')
    end
  end
end
