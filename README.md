<h1>Data Passing in Swift Apps</h1>

<p>This repository contains examples of data passing techniques in Swift for iOS development. The focus is on demonstrating various methods for forwarding and backward data passing between view controllers.</p>

<h1>Data Passing Techniques</h1>

<h2>1. Direct Property Assignment (Forward Data Passing)</h2>
<p><strong>Description:</strong> This method is used to set properties directly on a view controller before presenting it. It's straightforward and typically used for simple forward data passing.</p>
<p><strong>Example:</strong> Passing data from <code>ViewController</code> to <code>TextViewController</code>.</p>

<h2>2. Callback-Based Data Passing (Backward Data Passing)</h2>
<p><strong>Description:</strong> This method uses completion handlers (callbacks) to send data back to the previous view controller after it is dismissed. It's useful for handling results or updates after an action.</p>
<p><strong>Example:</strong> Sending text from <code>TextViewController</code> back to <code>ViewController</code> using a completion handler.</p>

<h2>3. Delegate Methods (Both Forward and Backward Data Passing)</h2>
<p><strong>Description:</strong> Delegates are a flexible way to handle communication between view controllers or objects. They allow for both forward and backward data passing with a decoupled approach.</p>
<p><strong>Example:</strong> Implementing a delegate protocol to pass text from <code>TextViewController</code> to <code>ViewController</code>.</p>

<h1>Repository Structure</h1>
<ul>
  <li><strong>Forward Data Passing:</strong> Shows how to use direct property assignment for passing data forward.</li>
  <li><strong>Backward Data Passing:</strong> Demonstrates using callback methods to pass data backward.</li>
  <li><strong>Delegate Methods:</strong> Illustrates using delegate protocols for both forward and backward data passing.</li>
</ul>
