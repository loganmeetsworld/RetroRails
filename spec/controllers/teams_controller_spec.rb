require 'rails_helper'

RSpec.describe TeamsController, type: :controller do

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

end


<%= form_for @team do |f| %> 
	<%= f.label :name %> <br>
	<%= f.text_field :name, required: true, size: "60", placeholder: "Team Name"%> 

	<br><br>
	
	<%= f.label :bio %> <br>
	<%= f.text_area :bio, size: "60x5", placeholder: "Team Description"%>
	
	<br><br>

	<%= f.label :password %> <br>
	<%= f.password_field(:password, onchange: "if ($('#password').val().length > 30) { alert('Your password needs to be shorter!'); }", placeholder: "Secrets") %>
	
	<br><br>

	<%= @team.persisted? ? (f.submit value: "Update Team", id: 'special-button') : (f.submit value: "Add Team", id: 'special-button') %>
	
<% end %>