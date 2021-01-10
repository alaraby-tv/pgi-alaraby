require "rails_helper"

RSpec.describe AttachmentMailer, type: :mailer do
  describe "email_on_creation" do
    let(:mail) { AttachmentMailer.email_on_creation }

    it "renders the headers" do
      expect(mail.subject).to eq("Email on creation")
      expect(mail.to).to eq(["to@example.org"])
      expect(mail.from).to eq(["from@example.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Hi")
    end
  end

  describe "email_on_delete" do
    let(:mail) { AttachmentMailer.email_on_delete }

    it "renders the headers" do
      expect(mail.subject).to eq("Email on delete")
      expect(mail.to).to eq(["to@example.org"])
      expect(mail.from).to eq(["from@example.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Hi")
    end
  end

end
