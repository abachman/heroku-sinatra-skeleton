When /^I follow "([^\"]*)"'s delete link$/ do |name|
  idea = Idea.first(:name => name)
  with_scope("#idea_#{idea.id}") do
    click_link("delete")
  end
end

Given /^there are 0 bevys$/ do
  Bevy.all.map(&:delete)
end

Then /^there should be 1 bevy$/ do
  Bevy.all.length.should == 1
end

