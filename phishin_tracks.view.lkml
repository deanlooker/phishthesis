view: phishin_tracks {
  sql_table_name: dean_looker_phish_thesis.phishin_tracks ;;

  dimension: id {
    primary_key: yes
    hidden: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: duration {
    type: number
    hidden:  yes
    sql: ${TABLE}.duration/1000 ;;
  }

  dimension: duration_minutes_seconds {
    label: "Song Duration"
    type: number
    sql: ${duration}/86400.0 ;;
    value_format: "hh:mm:ss"
    description: "Length of the song"
  }

#   dimension: duration_sec {
#     type: duration_second
#     sql: ${duration}/1000 ;;
#
#   }

#  dimension: jam_starts_at_second {
#    type: number
#    sql: ${TABLE}.jam_starts_at_second ;;
#  }

  dimension: likes_count {
    label: "Number of Likes"
    type: number
    sql: ${TABLE}.likes_count ;;
    description: "Number of people who have \"Liked\" the song on phish.in"
  }

  dimension: mp3 {
    label: "Audio Link"
    type: string
    sql: ${TABLE}.mp3 ;;
    description: "Link to listen to the track on phish.in"
  }

  dimension: position {
    type: number
    sql: ${TABLE}.position ;;
  }

  dimension: set {
    type: string
    sql: ${TABLE}.``set`` ;;
  }

  dimension: set_name {
    type: string
    sql: ${TABLE}.set_name ;;
  }

  dimension_group: show {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.show_date ;;
  }

  dimension: show_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.show_id ;;
  }

  dimension: slug {
    type: string
    sql: ${TABLE}.slug ;;
  }

  dimension: song_ids {
    type: number
    value_format_name: id
    sql: ${TABLE}.song_ids ;;
  }

  dimension: tags {
    hidden: yes
    sql: ${TABLE}.tags ;;
  }

  dimension: title {
    type: string
    sql: ${TABLE}.title ;;
  }

  measure: count {
    type: count
    drill_fields: [id, set_name, shows.showid, shows.tourname]
  }
}

view: phishin_tracks__tags {
  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: color {
    type: string
    sql: ${TABLE}.color ;;
  }

  dimension: ends_at_second {
    type: number
    sql: ${TABLE}.ends_at_second ;;
  }

  dimension: group {
    type: string
    sql: ${TABLE}.``group`` ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: notes {
    type: string
    sql: ${TABLE}.notes ;;
  }

  dimension: priority {
    type: number
    sql: ${TABLE}.priority ;;
  }

  dimension: starts_at_second {
    type: number
    sql: ${TABLE}.starts_at_second ;;
  }

  dimension: transcript {
    type: string
    sql: ${TABLE}.transcript ;;
  }
}
