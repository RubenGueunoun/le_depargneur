class Api::V1::LeadsController < Api::V1::BaseController

  def create
    @lead = Lead.new
    @lead.messenger_id =

    t.string "messenger_id"
    t.string "first_name"
    t.string "last_name"
    t.string "email_address"
    t.string "status"
    t.string "token"
    t.boolean "inscrit"
  end

end
