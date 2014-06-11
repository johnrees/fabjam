require "spec_helper"

describe MemberMailer do
  describe "accepted" do
    let(:mail) { MemberMailer.accepted }

    it "renders the headers" do
      mail.subject.should eq("Accepted")
      mail.to.should eq(["to@example.org"])
      mail.from.should eq(["from@example.com"])
    end

    it "renders the body" do
      mail.body.encoded.should match("Hi")
    end
  end

  describe "rejected" do
    let(:mail) { MemberMailer.rejected }

    it "renders the headers" do
      mail.subject.should eq("Rejected")
      mail.to.should eq(["to@example.org"])
      mail.from.should eq(["from@example.com"])
    end

    it "renders the body" do
      mail.body.encoded.should match("Hi")
    end
  end

end
