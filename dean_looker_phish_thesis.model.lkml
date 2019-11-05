connection: "phish_thesis"

# include all the views
include: "*.view"

datagroup: dean_looker_phish_thesis_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: dean_looker_phish_thesis_default_datagroup

explore: phishin_tracks {
  join: shows {
    type: left_outer
    sql_on: ${phishin_tracks.show_id} = ${shows.showid} ;;
    relationship: many_to_one
  }

  join: phishin_tracks__tags {
    view_label: "Phishin Tracks: Tags"
    sql: LEFT JOIN UNNEST(${phishin_tracks.tags}) as phishin_tracks__tags ;;
    relationship: one_to_many
  }
}

explore: phishin_venues {
  join: shows {
    type: left_outer
    sql_on: ${phishin_venues.show_ids} = ${shows.showid} ;;
    relationship: many_to_one
  }
}

explore: phishnet_shows {
  join: shows {
    type: left_outer
    sql_on: ${phishnet_shows.showid} = ${shows.showid} ;;
    relationship: many_to_one
  }
}

explore: shows {}
