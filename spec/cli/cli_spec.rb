require "spec_helper"

RSpec.describe "runbook", type: :aruba do
  let(:command) { "runbook" }

  before(:each) { run(command) }

  context "no arguments are given" do
    it "prints out a help message" do
      expect(last_command_started).to have_output(/Commands:/)
      expect(last_command_started).to have_output(/runbook help \[COMMAND\]/)
    end
  end

  describe "help" do
    let(:command) { "runbook help" }

    it "prints out a help message" do
      expect(last_command_started).to have_output(/Commands:/)
      expect(last_command_started).to have_output(/runbook help \[COMMAND\]/)
    end
  end

  describe "help flag" do
    let(:command) { "runbook -h" }

    it "prints out a help message" do
      expect(last_command_started).to have_output(/Commands:/)
      expect(last_command_started).to have_output(/runbook help \[COMMAND\]/)
    end
  end

  describe "unknown command" do
    let(:command) { "runbook unknown" }

    it "prints out unknown command message" do
      expect(last_command_started).to have_output(%q{Could not find command "unknown".})
    end
  end
end