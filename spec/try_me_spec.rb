require 'spec_helper'

describe TryMe do
  describe "#try_me" do
    it do
      actual = "bird".try_me { zzz | yyy | upcase }
      expected = "BIRD"
      expect(actual).to eq(expected)
    end

    it "allows methods to return nil" do
      klass = Class.new do
        def foo; end  # Returns nil

        def bar
          :not_nil
        end
      end

      actual = klass.new.try_me { zzz | foo | bar }  # Should return the value from `foo`.
      expect(actual).to be_nil
    end
  end
end
