/*
 * Extra typings definitions
 */

declare module 'openseadragon';

// Allow .json files imports
declare module '*.json';

// SystemJS module definition
declare var module: NodeModule;
interface NodeModule {
  id: string;
}
