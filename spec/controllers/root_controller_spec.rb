require 'rails_helper'

describe RootController, type: :controller do
  render_views

  describe '#show' do
    it 'should render the show template' do
      get :show

      response.should render_template('show')
    end

    it 'should set the featured_projects instance variable' do
      @project1 = FactoryGirl.create(:project, featured: true)
      @project2 = FactoryGirl.create(:project)

      get :show

      expect(assigns(:featured_projects)).to eq([@project1])
    end

    it 'should limit the featured_projects instance variable to 3 featured projects' do
      featured_projects = []

      # Create 5 featured projects
      [1..5].each do |index|
        featured_projects << FactoryGirl.create(:project, featured: true)
      end

      get :show

      expect(assigns(:featured_projects)).to eq(featured_projects[0..2])
    end

    it 'should set the featured_post instance variable' do
      @post = FactoryGirl.create(:post, featured: true)

      get :show

      expect(assigns(:featured_post)).to eq(@post)
    end

    it 'should limit the featured_post instance variable to the first featured post' do
      @post1 = FactoryGirl.create(:post, featured: true)
      @post2 = FactoryGirl.create(:post, featured: true)

      get :show

      expect(assigns(:featured_post)).to eq(@post1)
    end
  end
end
