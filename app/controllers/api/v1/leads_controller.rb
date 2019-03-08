class Api::V1::LeadsController < Api::V1::BaseController

  def create
    @lead = Lead.new
    @lead.messenger_id = params["messenger user id"]
    @lead.first_name = params["first name"]
    @lead.last_name = params["last name"]
    @lead.email_address = params["email_address"]
    @lead.status = "new lead"
    @lead.inscrit = false
    authorize(@lead)

    @lead.save
  end
end
