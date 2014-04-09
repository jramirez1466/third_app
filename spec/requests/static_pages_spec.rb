require 'spec_helper'

describe "StaticPages" do

  subject { page }

  describe "Home page" do
    before {visit root_path}

    it { should have_selector("h1", :text =>'Sample App') }
    it { should have_selector("title", :text =>'Home Page') }
  end
  describe "Help page" do
  before {visit help_path}

    it { should have_selector("h1", :text =>'Help Page') }
    it { should have_selector("title", :text =>'Help Page') }
    end
  end
    describe "About Us page" do
      before{visit about_path}

      it { should have_selector("h1", :text =>'About Us') }
      it { should have_selector("title", :text =>'About Page') }
    end
  end
  describe "contact page" do
    before {visit contact_path}

    it { should have_selector("h1", text: 'Contact Us') }
    it { should have_selector("title", text:'Contact page') }
    end
  end

end