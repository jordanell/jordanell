require 'rails_helper'

describe PostsController, type: :controller do
  render_views

  describe '#index' do
    it 'should render the index template' do
      get :index

      response.should render_template('index')
    end

    it 'should set the posts instance variable' do
      @post = FactoryGirl.create(:post, visible: true)

      get :index

      expect(assigns(:posts)).to eq([@post])
    end

    it 'should set the posts instance variable to only visible posts' do
      @post1 = FactoryGirl.create(:post, visible: true)
      @post2 = FactoryGirl.create(:post, visible: false)

      get :index

      expect(assigns(:posts)).to eq([@post1])
    end

    it 'should order the posts by created_at' do
      @post1 = FactoryGirl.create(:post, visible: true, created_at: 1.year.ago)
      @post2 = FactoryGirl.create(:post, visible: true, created_at: 2.year.ago)

      get :index

      expect(assigns(:posts)).to eq([@post1, @post2])
    end
  end

  describe '#show' do
    before(:each) do
      @post = FactoryGirl.create(:post, visible: true)

      @params = {
        id: @post.slug
      }
    end

    it 'should render the show template' do
      get :show, @params

      response.should render_template('show')
    end

    it 'should render 404 when post cannot be found' do
      get :show, id: 'wrong'

      response.should render_template('errors/show')
    end

    it 'should render 404 when post is not visible' do
      @post.visible = false
      @post.save

      get :show, @params

      response.should render_template('errors/show')
    end
  end
end
