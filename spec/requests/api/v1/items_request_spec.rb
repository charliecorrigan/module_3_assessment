require 'rails_helper'

describe "Items API" do
  it "can return a list of items" do

    10.times do |i|
      Item.create!(name: Faker::Coffee.blend_name,
                  description: Faker::Coffee.notes,
                  image_url: Faker::Avatar.image
                  )
    end

    # When I send a GET request to `/api/v1/items`
    get '/api/v1/items'
    # I receive a 200 JSON response containing all items
    expect(response).to be_success

    items = JSON.parse(response.body)
    item = items.first

    # And each item has an id, name, description, and image_url but not the created_at or updated_at
    expect(items.count).to eq(10)
    expect(item).to have_key("id")
    expect(item).to have_key("name")
    expect(item).to have_key("image_url")
    expect(item).to have_key("description")
    expect(item).to_not have_key("created_at")
    expect(item).to_not have_key("updated_at")
  end

  it "can retrieve an item by its id" do
    Item.create!(name: Faker::Coffee.blend_name,
                description: Faker::Coffee.notes,
                image_url: Faker::Avatar.image
                )
  # When I send a GET request to `/api/v1/items/1`

    get '/api/v1/items/1'
    # I receive a 200 JSON response containing the id, name, description, and image_url but not the created_at or updated_at
    expect(response).to be_success

    item = JSON.parse(response.body)

    expect(item).to have_key("id")
    expect(item).to have_key("name")
    expect(item).to have_key("image_url")
    expect(item).to have_key("description")
    expect(item).to_not have_key("created_at")
    expect(item).to_not have_key("updated_at")
  end

  it "can delete an existing item" do
    item = Item.create!(name: Faker::Coffee.blend_name,
                        description: Faker::Coffee.notes,
                        image_url: Faker::Avatar.image
                        )

    # When I send a DELETE request to `/api/v1/items/1`
    delete '/api/v1/items/1'

    # I receive a 204 JSON response if the record is successfully deleted
    expect(response).to have_http_status(204)
    expect{Item.find(item.id)}.to raise_error(ActiveRecord::RecordNotFound)
  end

  it "can create a new item" do

  # When I send a POST request to `/api/v1/items` with a name, description, and image_url
  # I receive a 201 JSON  response if the record is successfully created
  # And I receive a JSON response containing the id, name, description, and image_url but not the created_at or updated_at
  end
end


# * Verify that your non-GET requests work using Postman or curl. (Hint: `ActionController::API`). Why doesn't the default `ApplicationController` support POST and PUT requests?