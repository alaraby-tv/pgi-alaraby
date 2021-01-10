require "rails_helper"

RSpec.describe EpisodeMailer, type: :mailer do
  describe "email_on_creation" do
    let(:mail) { EpisodeMailer.email_on_creation }

    it "renders the headers" do
      expect(mail.subject).to eq("Email on creation")
      expect(mail.to).to eq(["to@example.org"])
      expect(mail.from).to eq(["from@example.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Hi")
    end
  end

  describe "email_on_update" do
    let(:mail) { EpisodeMailer.email_on_update }

    it "renders the headers" do
      expect(mail.subject).to eq("Email on update")
      expect(mail.to).to eq(["to@example.org"])
      expect(mail.from).to eq(["from@example.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Hi")
    end
  end

end
