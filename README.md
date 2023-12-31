
# Typewriter-Effect

A Swift Typewriter Effect that incorporates appending and deletion of text to display multiple lines of text in a typewriter style. Ideal for onboarding screens, storytelling apps, tutorials, or any application needing a sequential text reveal.

## Features

- **Typewriter Style Display:** Simulate the classic typewriter effect with text appearing and disappearing sequentially.
- **Recursive Array Iteration:** Efficiently handles multiple lines of text.
- **Error Handling:** Utilizes UUIDs to manage sessions and prevent crashes.

## Installation

1. **Clone the repository:**

2. **Navigate to your project directory and add the files:**

```bash
cd YourProjectDirectory
cp /path/to/TypewriterEffect/ViewModel.swift ./YourProject/Models
```

## How To Use

1. **Integrate ViewModel:**

    Ensure `ViewModel.swift` is added to your project directory, typically in a folder named `Models` or similar.

2. **Instantiate and Configure:**

    In your SwiftUI view, create an instance of the ViewModel and configure it to your needs.

```swift
import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel = ViewModel()

    var body: some View {
        Text(viewModel.text)
            .onAppear {
                viewModel.typeWriter()
            }
    }
}
```

3. **Start the Typing Effect:**

    Call the `typeWriter()` method on the ViewModel instance when you're ready to begin the effect.

## Customization

- **Text Array:** Modify the array of strings in `stringArray.swift` to display the text you want.
- **Typing Speed:** Adjust the typing speed by changing the delay parameters in the ViewModel methods.
- **Font:** Within your body add a typewriter-esque font style such as monospaced.

## Error Handling

The system uses UUIDs to ensure the stability of the typewriter sessions. This means there should be no errors upon reruns or multiple calls to the typeWriter() function.

## Contributing

Contributions are what make the open source community such an amazing place to learn, inspire, and create. Any contributions you make are **greatly appreciated**.

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## License

Distributed under the MIT License. See `LICENSE` for more information.

## Contact

Project Link: [https://github.com/arrrshia/typewriter-effect](https://github.com/arrrshia/typewriter-effect)

