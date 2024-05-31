![Static Badge](https://img.shields.io/badge/Swift-orange)
![Static Badge](https://img.shields.io/badge/UIKit-orange)
![Static Badge](https://img.shields.io/badge/MVVM--C-blue)
![Static Badge](https://img.shields.io/badge/Combine-red)

<body>

<h1>TrafficFactoryCase</h1>

<p>This is an iOS application designed to fetch, display and cache a list of items from a remote server. The app uses MVVM architecture and includes features such as lazy loading of images, error handling, data caching, and the ability to retry failed network requests.</p>

<h2>Features</h2>
<ul>
    <li><strong>MVVM Architecture</strong>: Separates data management and business logic from UI code.</li>
    <li><strong>Lazy Loading</strong>: Images are only downloaded when the corresponding cell becomes visible.</li>
    <li><strong>Data Caching</strong>: Caches the fetched data locally and displays it if network requests fail.</li>
    <li><strong>Error Handling</strong>: Displays an error message and a retry button if data fails to download.</li>
    <li><strong>Prefetching</strong>: Prefetches data for cells that are about to become visible.</li>
</ul>

<h2>Requirements</h2>
<ul>
    <li>iOS 14.0+</li>
    <li>Xcode 12.0+</li>
    <li>Swift 5.0+</li>
</ul>

<h2>Installation</h2>

<ol>
    <li><strong>Clone the repository</strong>:
        <pre><code>git clone https://github.com/yourusername/TrafficFactoryCase.git
cd TrafficFactoryCase</code></pre>
    </li>
    <li><strong>Open the project in Xcode</strong>:
        <pre><code>open TrafficFactoryCase.xcodeproj</code></pre>
    </li>
    <li><strong>Build and run the project</strong>: Select your target device or simulator and press <code>Cmd + R</code>.</li>
</ol>

<h2>Usage</h2>
<p>When you start the application, a loader will be displayed while data is being fetched from the remote server. Once the data is loaded, it will be displayed in a table view. Each cell contains an image, a title, and a description. If an image is still loading, a placeholder and activity indicator will be shown. If the network request fails, an error message and a retry button will be displayed.</p>

<h2>Architecture</h2>
<p>The app uses the Model-View-ViewModel (MVVM) architecture along with Coordinators for navigation. The main components are:</p>
<ul>
    <li><strong>Model</strong>: Defines the data structures (<code>Item</code>).</li>
    <li><strong>ViewModel</strong>: Handles data fetching, caching, and exposing data to the view (<code>ItemsViewModel</code>).</li>
    <li><strong>View</strong>: Displays the data to the user (<code>ViewController</code> and <code>CustomTableViewCell</code>).</li>
    <li><strong>NetworkManager</strong>: Handles network requests and caching of data.</li>
</ul>

<h2> Screenshot</h2>
<img src="https://github.com/nursaharii/TrafficFactoryCase/assets/33926714/b34e14c2-b62a-498b-96fa-953f8b38127b" width="240">
</body>

