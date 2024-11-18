---
title: Reaper
---

## Types

Type declarations included in the Reaper module.

### Reaper.**ReaperError**

<details disabled>
<summary tabindex="-1">Added in <code>0.1.0</code></summary>
No other changes yet.
</details>

```grain
enum ReaperError {
  ExpectedBoolean(String),
  ExpectedNumber(String),
  ExpectedInteger(String),
  ExpectedString(String),
  UnknownArgument(String),
}
```

Represents an error that occurred while parsing arguments.

Variants:

```grain
ExpectedBoolean(String)
```

The given argument was expected to be a boolean.

```grain
ExpectedNumber(String)
```

The given argument was expected to be a number.

```grain
ExpectedInteger(String)
```

The given argument was expected to be an integer.

```grain
ExpectedString(String)
```

The given argument was expected to be a string.

```grain
UnknownArgument(String)
```

An unknown argument was given.

### Reaper.**Argument**

<details disabled>
<summary tabindex="-1">Added in <code>0.1.0</code></summary>
No other changes yet.
</details>

```grain
enum Argument {
  ReaperVoid,
  ReaperString(String),
  ReaperBool(Bool),
  ReaperNumber(Number),
  ReaperInt(Number),
  ReaperMulti(List<String>),
}
```

Represents an argument that was parsed.

Variants:

```grain
ReaperVoid
```

Represents an argument that was present.

```grain
ReaperString(String)
```

Represents an argument that was a string.

```grain
ReaperBool(Bool)
```

Represents an argument that was a boolean.

```grain
ReaperNumber(Number)
```

Represents an argument that was a number.

```grain
ReaperInt(Number)
```

Represents an argument that was an integer.

```grain
ReaperMulti(List<String>)
```

Represents an argument that was multiple strings.

### Reaper.**Options**

<details disabled>
<summary tabindex="-1">Added in <code>0.1.0</code></summary>
No other changes yet.
</details>

```grain
record Options {
  options: Map.Immutable.Map<String, Argument>,
  presence: Set.Immutable.Set<String>,
  bools: Map.Immutable.Map<String, Bool>,
  numbers: Map.Immutable.Map<String, Number>,
  ints: Map.Immutable.Map<String, Number>,
  strings: Map.Immutable.Map<String, String>,
  multi: Map.Immutable.Map<String, List<String>>,
  rest: List<String>,
  passedArgs: List<String>,
}
```

Represents the options that were parsed from the arguments.

Fields:

|name|type|description|
|----|----|-----------|
|`options`|`Map.Immutable.Map<String, Argument>`|The complete list of options that were parsed.<br/><br/>Useful for queries.|
|`presence`|`Set.Immutable.Set<String>`|The arguments that were parsed as presence arguments.|
|`bools`|`Map.Immutable.Map<String, Bool>`|The arguments that were parsed as booleans.|
|`numbers`|`Map.Immutable.Map<String, Number>`|The arguments that were parsed as numbers.|
|`ints`|`Map.Immutable.Map<String, Number>`|The arguments that were parsed as integers.|
|`strings`|`Map.Immutable.Map<String, String>`|The arguments that were parsed as strings.|
|`multi`|`Map.Immutable.Map<String, List<String>>`|The arguments that were parsed as multiple strings.|
|`rest`|`List<String>`|The arguments that were not parsed.|
|`passedArgs`|`List<String>`|The arguments that were passed after `--`.|

## Values

Functions and constants included in the Reaper module.

### Reaper.**parse**

<details disabled>
<summary tabindex="-1">Added in <code>0.1.0</code></summary>
No other changes yet.
</details>

```grain
parse :
  (?aliases: Array<(String, String)>, ?presence: Array<String>,
   ?bools: Array<String>, ?numbers: Array<String>, ?ints: Array<String>,
   ?strings: Array<String>, ?multi: Array<String>,
   ?defaults: Array<(String, Argument)>, ?passArgs: Bool, args: Array<String>) =>
   Result<Options, ReaperError>
```

Parses the given arguments using the provided configuration.

Parameters:

|param|type|description|
|-----|----|-----------|
|`?aliases`|`Array<(String, String)>`|A list of aliases for the arguments|
|`?presence`|`Array<String>`|A list of arguments that can be present|
|`?bools`|`Array<String>`|A list of arguments that should be parsed as booleans|
|`?numbers`|`Array<String>`|A list of arguments that should be parsed as numbers|
|`?ints`|`Array<String>`|A list of arguments that should be parsed as integers|
|`?strings`|`Array<String>`|A list of arguments that should be parsed as strings|
|`?multi`|`Array<String>`|A list of arguments that should be parsed as multiple strings|
|`?defaults`|`Array<(String, Argument)>`|A list of key-value pairs representing the default values for arguments|
|`?passArgs`|`Bool`|Whether to skip arguments after `--`|
|`args`|`Array<String>`|The arguments to parse|

Returns:

|type|description|
|----|-----------|
|`Result<Options, ReaperError>`|`Ok(options)` where options is a record containing the parsed arguments, `Err(error)` otherwise|

Examples:

```grain
Reaper.parse(aliases=[>("h", "help")], presence=[> "help" ], bools=[> "verbose"], [> "-h", "--verbose"])
```

### Reaper.**toStringError**

<details disabled>
<summary tabindex="-1">Added in <code>0.1.0</code></summary>
No other changes yet.
</details>

```grain
toStringError : (err: ReaperError) => String
```

Converts the given Reaper error into a string.

Parameters:

|param|type|description|
|-----|----|-----------|
|`err`|`ReaperError`|The error to convert.|

Returns:

|type|description|
|----|-----------|
|`String`|The error message.|

Examples:

```grain
toStringError(UnknownArgument("foo")) == "Unexpected argument: foo"
```

```grain
toStringError(ExpectedBoolean("foo")) == "Expected a boolean value for argument: foo"
```

