# usecase

Generate a new StreamUseCase in [Dart][1].

## Usage 🚀

```sh
mason make stream_usecase --name GetStories --input_type Query --output_type List<Story>
```

## Variables ✨

| Variable      | Description                    | Default  | Type     |
| ------------- | ------------------------------ | -------- | -------- |
| `name`        | The name of the usecase class  | None     | `string` |
| `input_type`  | The input type of the usecase  | `String` | `string` |
| `output_type` | The output type of the usecase | `String` | `string` |

## Output 📦

```sh
└── get_stories_usecase.dart
```

[1]: https://dart.dev
