require "test_helper"

class VolcanosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @volcano = volcanos(:one)
  end

  test "should get index" do
    get volcanos_url, as: :json
    assert_response :success
  end

  test "should create volcano" do
    assert_difference("Volcano.count") do
      post volcanos_url, params: { volcano: { activity_evidence: @volcano.activity_evidence, country: @volcano.country, damage_mil: @volcano.damage_mil, day: @volcano.day, deaths: @volcano.deaths, elevation: @volcano.elevation, eq: @volcano.eq, houses_destroyed: @volcano.houses_destroyed, last_known_eruption: @volcano.last_known_eruption, latitude: @volcano.latitude, longitude: @volcano.longitude, month: @volcano.month, primary_volcano_type: @volcano.primary_volcano_type, total_damage_mil: @volcano.total_damage_mil, total_deaths: @volcano.total_deaths, tsu: @volcano.tsu, vei: @volcano.vei, volcano_name: @volcano.volcano_name, year: @volcano.year } }, as: :json
    end

    assert_response :created
  end

  test "should show volcano" do
    get volcano_url(@volcano), as: :json
    assert_response :success
  end

  test "should update volcano" do
    patch volcano_url(@volcano), params: { volcano: { activity_evidence: @volcano.activity_evidence, country: @volcano.country, damage_mil: @volcano.damage_mil, day: @volcano.day, deaths: @volcano.deaths, elevation: @volcano.elevation, eq: @volcano.eq, houses_destroyed: @volcano.houses_destroyed, last_known_eruption: @volcano.last_known_eruption, latitude: @volcano.latitude, longitude: @volcano.longitude, month: @volcano.month, primary_volcano_type: @volcano.primary_volcano_type, total_damage_mil: @volcano.total_damage_mil, total_deaths: @volcano.total_deaths, tsu: @volcano.tsu, vei: @volcano.vei, volcano_name: @volcano.volcano_name, year: @volcano.year } }, as: :json
    assert_response :success
  end

  test "should destroy volcano" do
    assert_difference("Volcano.count", -1) do
      delete volcano_url(@volcano), as: :json
    end

    assert_response :no_content
  end
end
