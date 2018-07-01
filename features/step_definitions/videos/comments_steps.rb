Given("that I am logged in the application") do
  @user = User.new(nick: "leoncio", senha: "qwerty", email: "leoncio@walrus.su")
  @user.save!
  page.driver.browser.set_cookie "login=leoncio"
end

Given("I am on an existing video page") do
  @video = Video.new(title: "Furious lion", description: "Watch how this lion does nothing.")
  @video.arq_video = "#{Rails.root}public/uploads/1/lion-sample.mp4"
  @video.file_path = @video.arq_video
  @video.valid = "lion-sample.mp4"
  @video.user = 1
  @video.save!
  visit("/videos?name_video=Furious lion")
end

When("I write a comment {string}") do |comment|
  fill_in 'commit', with: comment
end

Then("I should receive the message {string}") do |msg|
  expect(page).to have_content msg
  @comment.destroy unless @comment.nil?
  @user.destroy unless @user.nil?
  @video.destroy unless @video.nil?
end

Given("the video already has a comment {string} written") do |string|
  @comment = Comment.build_from(@video, @user.id, string)
  @comment.user = @user
  @comment.save!
  visit("/videos?name_video=Furious lion")
end

When("I click {string}") do |link|
  if link == "Comentar"
    click_button link
  elsif link == "Postar Resposta"
    click_button link
  elsif link == "responder"
    find('.comment-reply', :text => link).click
  else
    find('#deletando', :text => link).click
  end
end

When("I click {string} answer") do |link|
  page.all(:css,"a[id='deletando']").last.click
end

Given("the comment has an answer {string}") do |ans|
  page.driver.browser.set_cookie "login='leoncio'"
  visit("/videos?name_video=Furious lion")
  find('.comment-reply', :text => "responder").click
  fill_in 'answer', with: ans
  click_button "Postar Resposta"
  visit("/videos?name_video=Furious lion")
  page.driver.browser.clear_cookies
  visit("/videos?name_video=Furious lion")
end

Given("that I am not logged in the application") do
  @user = User.new(nick: "leoncio", senha: "qwerty", email: "leoncio@walrus.su")
  @user.save!
  page.driver.browser.clear_cookies
end

When("I write an answer {string}") do |ans|
  fill_in 'answer', with: ans
end

Given("the comment already has an answer {string} written") do |ans|
  find('.comment-reply', :text => "responder").click
  fill_in 'answer', with: ans
  click_button "Postar Resposta"
  visit("/videos?name_video=Furious lion")
  expect(page).to have_content ans
end

When("I want to delete the answer") do
  find('#deletando',:text => "deletar").click
end

Then("I should not find the {string} button") do |btn|
  expect(page).not_to have_content btn
  @comment.destroy unless @comment.nil?
  @user.destroy unless @user.nil?
  @video.destroy unless @video.nil?
end

When("I want to delete the comment") do
  expect(page).to have_content "funny comment here"
end
