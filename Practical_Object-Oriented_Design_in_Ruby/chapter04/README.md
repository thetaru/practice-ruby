# 4.3 パブリックインターフェースを見つける
- [ ] suitable_tripsメッセージが複数クラス\(TripクラスとBicycleクラス\)の責任を持っている
- [ ] (need_bikeパラメータを持つ)suitable_tripsメッセージの受け取り手はTripクラスであるべきでない
```mermaid
sequenceDiagram
  participant moe_Customer as moe<br>Customer
  participant class_Trip as class<br>Trip
  moe_Customer->>+class_Trip: suitable_trips(on_date, of_difficulty, need_bike)
  class_Trip-->>-moe_Customer: response
```

- [ ] Customerに適切な旅行を探す処理が増えた
- [x] suitable_tripsメッセージが複数クラス\(TripクラスとBicycleクラス\)の責任を持っている
  - Bicycleクラスを作成し、MoeがBicycleに聞くように変更
- [x] (need_bikeパラメータを持つ)suitable_tripsメッセージの受け取り手はTripクラスであるべきでない
  - suitable_tripsメッセージから分離した箇所をsuitable_bicycleに実装
  - suitable_bicycleメッセージがBicycleの責任を持たせる
```mermaid
sequenceDiagram
  participant moe_Customer as moe<br>Customer
  participant class_Trip as class<br>Trip
  participant class_Bicycle as class<br>Bicycle
  moe_Customer->>+class_Trip: suitable_trips(on_date, of_difficulty)
  class_Trip-->>-moe_Customer: response
  loop
    moe_Customer-->moe_Customer: for each trip found
  end
  moe_Customer->>+class_Bicycle: suitable_bicycle(trip_date, route type)
  class_Bicycle-->>-moe_Customer: response
```

- [x] Customerに適切な旅行を探す処理が増えた
  - TripFinderクラスを作成し、旅行選定の責任を持たせる
- [x] suitable_tripsメッセージが複数クラス(TripクラスとBicycleクラス)の責任を持っている
  - Bicycleクラスを作成し、TripFinderがBicycleに聞くように変更
- [x] (need_bikeパラメータを持つ)suitable_tripsメッセージの受け取り手はTripクラスであるべきでない
  - suitable_tripsメッセージから分離した箇所をsuitable_bicycleに実装
  - suitable_bicycleメッセージがBicycleの責任を持たせる
```mermaid
sequenceDiagram
  participant moe_Customer as moe<br>Customer
  participant a_TripFinder as a<br>TripFinder
  participant class_Trip as class<br>Trip
  participant class_Bicycle as class<br>Bicycle
  moe_Customer->>+a_TripFinder: suitable_trips(on_date, of_difficulty, need_bike)
  a_TripFinder->>+class_Trip: suitable_trips(on_date, of_difficulty)
  class_Trip-->>-a_TripFinder: response
  loop
    a_TripFinder-->a_TripFinder: for each trip found
  end
  a_TripFinder->>+class_Bicycle: suitable_bicycle(trip_date, route type)
  class_Bicycle-->>-a_TripFinder: response
  a_TripFinder->>-moe_Customer: response
```