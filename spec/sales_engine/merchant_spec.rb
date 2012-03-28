require 'spec_helper'

describe SalesEngine::Merchant do


  describe ".random" do
    it "returns a merchant" do
      SalesEngine::Merchant.random.class.should == SalesEngine::Merchant
    end

    it "returns different merchants on two calls" do
      y = SalesEngine::Merchant.random
      z = SalesEngine::Merchant.random

      while y == z
        y = SalesEngine::Merchant.random
        z = SalesEngine::Merchant.random
      end

      y should_not = z

    end
  end

  describe ".find_by_id" do

    it "returns a merchant" do
      SalesEngine::Merchant.find_by_id(3).class.should == SalesEngine::Merchant
    end

    it "returns the correct customer id" do
      random_id = rand(100)
      SalesEngine::Merchant.find_by_id(random_id).id.should == random_id
    end
  end

  describe ".find_all_by_id" do

    it "returns an array" do
      SalesEngine::Merchant.find_all_by_id(3).class.should == Array
    end
  end

  describe ".find_by_name" do

    it "finds merchant with matching name" do
      SalesEngine::Merchant.find_by_name("Bosco and Sons").name.should == "Bosco and Sons"
    end
  end

    it "finds a merchant" do
      SalesEngine::Merchant.find_by_name("Bosco and Sons").class.should == SalesEngine::Merchant
    end

  describe ".find_all_by_name" do

    it "returns an array" do
      SalesEngine::Merchant.find_all_by_name("O'Kon Inc").class.should == Array
    end

    it "returns an array of merchants" do
      SalesEngine::Merchant.find_all_by_name("O'Kon Inc").each do |merch|
        merch.class.should == SalesEngine::Merchant
      end
    end
  end

  describe "#items" do
    it "returns an array" do
      SalesEngine::Merchant.random.items.class.should ==Array
    end

    it "returns an array of items" do
      SalesEngine::Merchant.random.items.each do |item|
        item.class.should == SalesEngine::Item
      end
    end
  end

  describe "#invoices" do
    it "returns an array" do
      SalesEngine::Merchant.random.invoices.class.should ==Array
    end

    it "returns an array of invoices" do
      SalesEngine::Merchant.random.invoices.each do |invoice|
        invoice.class.should == SalesEngine::Invoice
      end
    end
  end

  describe ".most_revenue(x)" do
    x=rand(20)
    it "returns an array" do
      SalesEngine::Merchant.most_revenue(x).class.should ==Array
    end

    it "returns an array of merchants" do
      SalesEngine::Merchant.most_revenue(x).each do |merchant|
        merchant.class.should == SalesEngine::Merchant
      end
    end

    it "returns an array of length x" do
      SalesEngine::Merchant.most_revenue(x).length.should == x
    end
  end

  describe "#revenue(*date)"
  date="2012-02-14"
  it "returns a revenue in BigDecimal for the merchant if no date provided" do
    SalesEngine::Merchant.random.revenue.class.should ==BigDecimal
  end

  it "returns a revenue in BigDecimal for the merchant by date if a date is provided" do
    SalesEngine::Merchant.random.revenue(date).class.should ==BigDecimal
  end

  describe ".most_items(x)" do
    x=rand(20)
    it "returns an array" do
      SalesEngine::Merchant.most_items(x).class.should ==Array
    end

    it "returns an array of merchants" do
      SalesEngine::Merchant.most_items(x).each do |merchant|
        merchant.class.should == SalesEngine::Merchant
      end
    end

    it "returns an array of length x" do
      SalesEngine::Merchant.most_items(x).length.should == x
    end
  end

end










